require 'job_site'

RSpec.describe JobSite, 'JobSite' do
  # Initialize job site wihtout contact instance.
  subject(:job_site) { JobSite.new }
  it 'should respond to contact name' do
    # job_site instance should respond to name even
    # it has no real conact instance in it.
    expect(job_site.contact_name).to eq('no name')
  end
end
