require 'spec_helper'

describe 'StarRequiredFields' do
  before do
    class Project < ActiveRecord::Base
      validates_presence_of :title
    end
  end
  it 'should return list of star_required_fields for a given model' do
    expect(StarRequiredFields.needed_for("Project", "title")).to be_true
    expect(StarRequiredFields.needed_for("Project", "summary")).to be_false
  end
end
