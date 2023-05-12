require 'rails_helper'
require 'rake'

RSpec.describe "custom_seed rake task" do
  before(:all) do
    Rake::Task.clear
    WorldCooking::Application.load_tasks
  end

  it "loads all seed files in db/seeds directory" do
    task_name = 'db:seed:all'

    expect(Rake::Task.task_defined?(task_name)).to eq(true)
    expect(Rake::Task[task_name].prerequisites).to include('environment')

    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = "db:seed:#{File.basename(filename, '.rb')}"

      expect(Rake::Task.task_defined?(task_name)).to eq(true)
      expect(Rake::Task[task_name].prerequisites).to include('environment')
    end
  end
end
