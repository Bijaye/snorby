require 'snorby/payload'

class Payload
  
  include DataMapper::Resource

  storage_names[:default] = "data"
  
  belongs_to :sensor, :parent_key => [ :sid ], :child_key => [ :sid ], :required => true
  
  belongs_to :event, :parent_key => [ :sid, :cid ], :child_key => [ :sid, :cid ], :required => true
  
  property :sid, Integer, :key => true, :index => true
  
  property :cid, Integer, :key => true, :index => true
  
  property :data_payload, Text


  def to_s
    Snorby::Payload.new([data_payload].pack('H*'), :width => 26).to_s
  end
  
  def to_html
    Snorby::Payload.new([data_payload].pack('H*'), :width => 26, :html => true).to_s.html_safe
  end
  
  def to_ascii
    Snorby::Payload.new([data_payload].pack('H*'), :width => 26, :ascii => true).to_s.html_safe
  end

end