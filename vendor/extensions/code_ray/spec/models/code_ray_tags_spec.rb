require File.dirname(__FILE__) + '/../spec_helper'

describe "Code Ray Tags" do
  dataset :users_and_pages, :file_not_found, :snippets

  before :each do
    page
  end

  it "should render the code" do
    page.should render('<r:code>Hello</r:code>').as(%Q{<div class="CodeRay">\n  <div class="code"><pre>Hello</pre></div>\n</div>\n})
  end

  it "should render the code with line numbers" do
    page.should render('<r:code line_numbers="true">Hello</r:code>').as(%Q{<div class="CodeRay">\n  <div class="code"><pre><span class="no">1</span> Hello</pre></div>\n</div>\n})
  end

  it "should render the code even without line numbers" do
    page.should render('<r:code line_numbers="false">Hello</r:code>').as(%Q{<div class="CodeRay">\n  <div class="code"><pre>Hello</pre></div>\n</div>\n})
  end

  it "should render the code with an invalid language as plaintext" do
    page.should render('<r:code language="abcxyzfoobar">Hello</r:code>').as(%Q{<div class="CodeRay">\n  <div class="code"><pre>Hello</pre></div>\n</div>\n})
  end

  it "should render the code with a valid language" do
    page.should render('<r:code language="html"><b>Hello</b></r:code>').as(%Q{<div class="CodeRay">\n  <div class="code"><pre><span class="ta">&lt;b&gt;</span>Hello<span class="ta">&lt;/b&gt;</span></pre></div>\n</div>\n})
  end


  private

  def page(symbol = nil)
    if symbol.nil?
      @page ||= pages(:assorted)
    else
      @page = pages(symbol)
    end
  end

end
