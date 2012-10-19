require 'spec_helper'

describe Netzke::Basepack::DataAdapters::AbstractAdapter do
  before(:each) do
    Netzke::Draper::Configuration.reset_config
    @decorated_component = DecoratedComponent.new
    @undecorated_component = UndecoratedComponent.new
  end

  describe "#find_record" do
    before(:each) do
      Book.stub_chain(:where, :first).and_return(Book.new)
    end

    it "decorated component" do
      @decorated_component.data_adapter.find_record(1).should be_a(BookDecorator)
    end

    it "undecorated component" do
      @undecorated_component.data_adapter.find_record(1).should be_a(Book)
    end
  end

  describe "#new_record" do
    it "decorated component" do
      @decorated_component.data_adapter.new_record.should be_a(BookDecorator)
    end

    it "undecorated component" do
      @undecorated_component.data_adapter.new_record.should be_a(Book)
    end
  end

  describe "#first" do
    before(:each) do
      Book.stub(:first).and_return(Book.new)
    end

    it "decorated component" do
      @decorated_component.data_adapter.first.should be_a(BookDecorator)
    end

    it "undecorated component" do
      @undecorated_component.data_adapter.first.should be_a(Book)
    end
  end
end
