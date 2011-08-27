# encoding: UTF-8
class Shoe < ActiveRecord::Base
  validates_presence_of :article_number
  validates_presence_of :name

  has_many :colors_shoes
  has_many :colors, :through => :colors_shoes

  has_many :shoes_sizes
  has_many :sizes, :through => :shoes_sizes

  HEELS = %W(sin-taco bajo medio alto)
  validates_inclusion_of :heel, :in => HEELS

  SEASON_NAMES = %W(primavera verano otoño invierno)
  validates_inclusion_of :season_name, :in => SEASON_NAMES
  validates_numericality_of :year, :greater_than_or_equal_to => 1900, :less_than_or_equal_to => 2100

  # @return [String] campaign name
  def campaign
    "#{season_name}-#{year}"
  end

  def campaign=(string)
    self.year, self.season_name = self.class.parse_campaign_name(string)
  end

  # scopes shoes that belong to a given campaign
  # @return [Scope]
  def self.by_campaign(campaign)
    q_year, q_season_name = parse_campaign_name(campaign)
    where(:year => q_year, :season_name => q_season_name)
  end

  private
  # parses string to get season_name and year
  # @return [Array] [year, season_name]
  def self.parse_campaign_name(string)
    string.match(/(#{SEASON_NAMES.join('|')})-(\d{4})/)
    return $2, $1
  end
end
