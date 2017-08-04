require 'test_helper'

describe Bocu::Coub, :vcr do
  describe '#find' do
    subject { Bocu::Coub.find('21047') }

    it 'finds coub by given id' do
      subject.title.must_equal('никита сергеевич ламар')
    end

    it 'returns single Bocu::Coub instance' do
      subject.must_be_kind_of Bocu::Coub
    end
  end

  describe '#search' do
    subject { Bocu::Coub.search('drive').fetch.sample }

    it 'searches coubs with provided query' do
      subject.title.must_match(/drive/i)
    end

    it 'returns array of Bocu::Search instances' do
      subject.must_be_kind_of Bocu::Search
    end
  end

  describe '#by_tag' do
    subject { Bocu::Coub.by_tag('cats').fetch.sample }

    it 'returns coubs with given tag' do
      tags = subject.tags.map { |t| t[:title] }
      tags.to_s.must_match(/cats/i)
    end

    it 'returns array of Bocu::Timelines::Tag instances' do
      subject.must_be_kind_of Bocu::Timelines::Tag
    end
  end

  describe '#hot' do
    subject { Bocu::Coub.hot.fetch.sample }

    it 'returns array of Bocu::Timelines::Hot instances' do
      subject.must_be_kind_of Bocu::Timelines::Hot
    end
  end

  describe '#random' do
    subject { Bocu::Coub.random.fetch.sample }

    it 'returns array of Bocu::Timelines::Hot instances' do
      subject.must_be_kind_of Bocu::Timelines::Explore
    end
  end

  describe '#newest' do
    subject { Bocu::Coub.newest.fetch.sample }

    it 'returns array of Bocu::Timelines::Hot instances' do
      subject.must_be_kind_of Bocu::Timelines::Explore
    end
  end

  describe '#coub_of_the_day' do
    subject { Bocu::Coub.coub_of_the_day.fetch.sample }

    it 'returns array of Bocu::Timelines::Hot instances' do
      subject.must_be_kind_of Bocu::Timelines::Explore
    end
  end
end
