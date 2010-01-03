module CodeRayTags
  include Radiant::Taggable

  desc %{
    Outputs formatted source code, enclosed in &lt;code&gt; tags. Use parameter language to specify the language the source code is in.
    Supported languages are:
    <ul>
      <li>c</li>
      <li>css</li>
      <li>delphi</li>
      <li>diff</li>
      <li>html</li>
      <li>java</li>
      <li>java_script</li>
      <li>json</li>
      <li>plaintext</li>
      <li>rhtml</li>
      <li>ruby</li>
      <li>scheme</li>
      <li>sql</li>
      <li>xhtml</li>
      <li>xml</li>
      <li>yaml</li>
    </ul>
    *Usage:* 
    <pre><code><r:code language="html" [line_numbers="true"] [textile="true"]>...source code goes here...</r:code></code></pre>
    *Note:* If you are using Textile be sure to add <notexttile>...</notextile> tags around the <r:code /> call or
    pass the textile="true" attribute.
  }
  tag 'code' do |tag|
    lang = tag.attributes['language'] || 'plaintext'
    line_numbers =  boolean_attr_or_error(tag, 'line_numbers', 'false') ? :inline : nil
    code = CodeRay.scan(tag.expand.to_s.strip, lang.to_sym).html(:wrap => :div, :line_numbers => line_numbers )
    code = "<notextile>#{code}</notextile>" if boolean_attr_or_error(tag, 'textile', 'false')
    code 
  end
end
