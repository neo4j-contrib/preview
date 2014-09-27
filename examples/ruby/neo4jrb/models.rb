class Movie
  include Neo4j::ActiveNode
  property :title
  has_many :in, :actors, type: :ACTED_IN, model_class: :Person
end

class Engagement
  include Neo4j::ActiveRel
  # set_label_name:
  property :roles
end

class Person
  include Neo4j::ActiveNode
  property :name
  has_many :out, :acted_in, model_class: :Movie, type: :ACTED_IN, rel_class: Engagement
end
