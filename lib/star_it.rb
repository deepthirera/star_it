require 'rails'
require 'action_view'
require 'active_record'

require "star_it/version"
require "star_it/star_required_fields"
require "star_it/label_form_builder"
require 'star_it/form_helper'
ActionView::Base.send(:include, StarIt::FormHelper) if defined?(ActionView::Base)
