require 'spec_helper'

describe Netzke::Basepack::DataAdapters::ActiveRecordAdapter do
  before(:each) do
    Netzke::Draper::Configuration.reset_config
    @decorated_component = DecoratedComponent.new
    @undecorated_component = UndecoratedComponent.new
  end

  describe "#get_records" do
    before(:each) do
      @decorated_component.data_adapter.stub_chain(:get_relation, :all).and_return([Book.new])
    end

    describe "decorated component" do
      it "decorates collection" do
        @decorated_component.data_adapter.get_records({}).should be_a(Draper::DecoratedEnumerableProxy)
      end

      it "decorates elements" do
        @decorated_component.data_adapter.get_records({}).each do |element|
          element.should be_a(BookDecorator)
        end
      end
    end

    describe "undecorated component" do
      before(:each) do
        @undecorated_component.data_adapter.stub_chain(:get_relation, :all).and_return([Book.new])
      end

      it "doesn't decorate collection" do
        @undecorated_component.data_adapter.get_records({}).should_not be_a(Draper::DecoratedEnumerableProxy)
      end

      it "doesn't decorate elements" do
        @undecorated_component.data_adapter.get_records({}).each do |element|
          element.should be_a(Book)
        end
      end
    end
  end

end
