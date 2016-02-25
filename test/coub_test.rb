require 'test_helper'

describe CoubApi::Coub, :vcr do
  describe '#find' do
    subject { CoubApi::Coub.find('21047') }

    it 'finds coub by given id' do
      subject.title.must_equal('никита сергеевич ламар')
    end

    it 'returns single CoubApi::Coub instance' do
      subject.must_be_kind_of CoubApi::Coub
    end
  end

  describe '#search' do
    subject { CoubApi::Coub.search('drive').fetch.sample }

    it 'searches coubs with provided query' do
      subject.title.must_match(/drive/i)
    end

    it 'returns array of CoubApi::Search instances' do
      subject.must_be_kind_of CoubApi::Search
    end
  end

  describe '#by_tag' do
    subject { CoubApi::Coub.by_tag('cats').fetch.sample }

    it 'returns coubs with given tag' do
      tags = subject.tags.map { |t| t[:title] }
      tags.to_s.must_match(/cats/i)
    end

    it 'returns array of CoubApi::Timelines::Tag instances' do
      subject.must_be_kind_of CoubApi::Timelines::Tag
    end
  end

  describe '#hot' do
    subject { CoubApi::Coub.hot.fetch.sample }

    it 'returns array of CoubApi::Timelines::Hot instances' do
      subject.must_be_kind_of CoubApi::Timelines::Hot
    end
  end

  describe '#random' do
    subject { CoubApi::Coub.random.fetch.sample }

    it 'returns array of CoubApi::Timelines::Hot instances' do
      subject.must_be_kind_of CoubApi::Timelines::Explore
    end
  end

  describe '#newest' do
    subject { CoubApi::Coub.newest.fetch.sample }

    it 'returns array of CoubApi::Timelines::Hot instances' do
      subject.must_be_kind_of CoubApi::Timelines::Explore
    end
  end

  describe '#coub_of_the_day' do
    subject { CoubApi::Coub.coub_of_the_day.fetch.sample }

    it 'returns array of CoubApi::Timelines::Hot instances' do
      subject.must_be_kind_of CoubApi::Timelines::Explore
    end
  end
end
