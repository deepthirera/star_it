require 'spec_helper'

describe 'LabelFormBuilder' do
  before do
    project_class = double('Project', name: 'Project')
    @project = double('project', longname: 'Project', class: project_class)
    @template = ActionView::Base.new
    @parent_builder = ActionView::Helpers::FormBuilder.new(:project, @project, @template, {}, nil)
  end

  context 'required fields' do
    before do
      StarRequiredFields.should_receive(:needed_for).with('Project', :name).and_return(true)
    end
    it 'should add class star to label tag if no class is present' do
      expect(@parent_builder.label(:name)).to eq('<label class="star_it " for="project_name">Name</label>')
    end

    it 'should append star class to existing class' do
      expect(@parent_builder.label(:name, 'title', class: 'title')).to eq('<label class="star_it title" for="project_name">title</label>')
    end
  end

  context 'not required fields' do
    it 'should add class star to label tag if no class is present' do
      StarRequiredFields.should_receive(:needed_for).with('Project', :name).and_return(false)
      expect(@parent_builder.label(:name)).to eq('<label for="project_name">Name</label>')
    end
  end
end
