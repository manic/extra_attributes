require 'spec_helper'

describe ExtraAttribute do
  describe "Expected ActiveRecord behavior" do
    describe "common" do
      it "handles an empty string of attributes" do
        person = Person.create(:name =>'')
        person.should_not be_new_record
      end
      it "sets all of the attributes" do
        person = Person.create!({
          :age=>99,
          :name => "John"
        })
        person.age.should eql(99)
        person.name.should eql('John')
      end
    end
  end

  describe "A custom attribute" do
    describe "John is a Person" do
      before( :each ) do
        @person = Person.new
      end
      it "who knows his name" do
        @person.name = 'John'
        @person.name.should eql('John')
      end

      it "who can change his name" do
        @person.name = 'John'
        @person.name = 'Joe'
        @person.name.should eql('Joe')
      end
    end

    describe "John is a Person whose name is changed" do
      before( :each ) do
        @person = Person.create(:name => "John")
      end

      it "who changes his name but not save." do
        @person.name = 'Koh'
        @person.name.should eql('Koh')
        @person.reload
        @person.name.should eql('John')
      end

      it "who changes his name and saved." do
        @person.name = 'Koh'
        @person.name.should eql('Koh')
        @person.save
        @person.reload
        @person.name.should eql('Koh')
      end
    end
  end
end
