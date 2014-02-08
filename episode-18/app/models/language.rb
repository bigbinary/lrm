class Language

  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns :name           => :string,
          :static         => :boolean,
          :dynamic        => :boolean,
          :wikipedia_link => :string,
          :inventor_name  => :string,
          :inventor_wikipedia_link => :string

end
