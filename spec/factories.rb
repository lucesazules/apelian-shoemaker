require 'factory_girl'

Factory.define :shoe do |f|
  f.sequence(:name) { |n| "shoe#{n}"}
  f.sequence(:article_number) { |n| n }
  f.heel Shoe::HEELS.first
  f.year "2011"
  f.season_name Shoe::SEASON_NAMES.first
end

Factory.define :color do |f|
  f.sequence(:name) { |n| "color#{n}"}
end

Factory.define :colors_shoe do |f|
  f.association :shoe
  f.association :color
end

Factory.define :size do |f|
  f.sequence(:number) { |n| "size#{n}"}
end

Factory.define :shoes_size do |f|
  f.association :shoe
  f.association :size
end