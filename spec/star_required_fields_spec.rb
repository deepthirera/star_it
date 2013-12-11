require 'spec_helper'

describe 'StarRequiredFields' do
  before do
    class Project < ActiveRecord::Base
      validates_presence_of :title
      validates_presence_of :description
    end

    class SubProject < Project
      validates_presence_of :body
    end
  end
  it 'should return list of star_required_fields for a given model' do
    expect(StarRequiredFields.needed_for("Project", "title")).to be_true
    expect(StarRequiredFields.needed_for("Project", "description")).to be_true
    expect(StarRequiredFields.needed_for("Project", "summary")).to be_false
  end

  it 'should return false if table does not exist' do
    expect(StarRequiredFields.needed_for("OpenStruct", "name")).to be_false
  end

  it 'should validate for inherited models' do
    expect(StarRequiredFields.needed_for("SubProject", "body")).to be_true
    expect(StarRequiredFields.needed_for("SubProject", "description")).to be_true
  end
end
