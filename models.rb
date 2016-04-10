class Root
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :roottitles
  has n, :titles, :through => :roottitles

  has n, :rootfeatures
  has n, :features, :through => :rootfeatures

  def list_of_titles
    arr = []
    self.titles.each {|t| arr<< t.name}
    arr
  end

  def list_of_features
    arr = []
    self.features.each {|t| arr<< t.name }
    arr
  end

  def list_of_features_with_details
    arr = []
    self.features.each {|t| arr<< {t.name => t.detail.title} unless t.detail.nil?}
    arr
  end

  def full_description
    h = {'titles' => self.list_of_titles, 'features' => self.list_of_features_with_details}
    h
  end

  def full_json
    self.full_description.to_json
  end

end

class Title
  include DataMapper::Resource

  property :id,           Serial
  property :name,       String 

  has n, :roottitles
  has n, :roots, :through => :roottitles
end

class Feature
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String, :unique => true

  has n, :rootfeatures
  has n, :roots, :through => :rootfeatures

  has 1, :detail

end

class Roottitle
  include DataMapper::Resource

  belongs_to :root, :key => true
  belongs_to :title, :key => true
end

class Rootfeature
  include DataMapper::Resource

  belongs_to :root, :key => true
  belongs_to :feature, :key => true
end

class Detail
  include DataMapper::Resource

  property :id, Serial
  property :title, String

  belongs_to :feature

end