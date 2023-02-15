# frozen_string_literal: true

require 'docker'
require 'serverspec'
require 'spec_helper'

describe 'Ruby Sinatra Image' do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :backend, :docker
    set :docker_image, image.id
  end

  describe command('ruby --version') do
    its(:stdout) { should match 'ruby 3.1.3p185'}
  end

  describe command('bundler --version') do
    its(:stdout) { should match 'Bundler version 2.4.6' }
  end

  describe command('gem list | grep sinatra') do
    its(:stdout) { should match "sinatra (3.0.5)\n" }
  end

end
