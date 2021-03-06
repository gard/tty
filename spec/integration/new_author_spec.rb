# encoding: utf-8

RSpec.describe 'teletype new --author', type: :cli do
  it "sets an author" do
    app_name = tmp_path('newcli')
    command = "bundle exec teletype new #{app_name} --author 'Author A'"
    `#{command}`

    license = ::File.binread(tmp_path('newcli/LICENSE.txt'))
    expect(license).to include('Author A')
  end

  it "sets multiple authors" do
    app_name = tmp_path('newcli')
    command = "bundle exec teletype new #{app_name} --author 'Author A' 'Author B'"
    `#{command}`

    license = ::File.binread(tmp_path('newcli/LICENSE.txt'))
    expect(license).to include('Author A, Author B')
  end
end
