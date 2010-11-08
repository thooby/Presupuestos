class Asiento < ActiveRecord::Base
belongs_to :prog
belongs_to :dep
belongs_to :mini
has_one :compara
end
