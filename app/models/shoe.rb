# encoding: UTF-8
class Shoe < ActiveRecord::Base

  validates_presence_of :article_number
  validates_presence_of :name

  has_many :colors_shoes
  has_many :colors, :through => :colors_shoes

  has_many :shoes_sizes
  has_many :sizes, :through => :shoes_sizes

  LOW_HEEL = 'bajo'
  MED_HEEL = 'medio'
  HIGH_HEEL = 'alto'
  HEELS = [LOW_HEEL, MED_HEEL, HIGH_HEEL]
  validates_inclusion_of :heel, :in => HEELS

  SEASON_NAMES = %W(primavera verano otoño invierno)
  validates_inclusion_of :season_name, :in => SEASON_NAMES
  validates_numericality_of :year, :greater_than_or_equal_to => 1900, :less_than_or_equal_to => 2100

  scope :trend, where( :trend => true )

  # Returns next shoe
  # @param [Symbol] order_criteria. Defaults to :name
  # @param [] scope
  # @return [Shoe] next shoe
  def next_shoe(order_criteria = :name, scope = Shoe)
    scope.order(order_criteria).where("#{order_criteria} > ?", self.send(order_criteria)).first
  end

  # Returns previous shoe
  # @param [Symbol] order_criteria. Defaults to :name
  # @param [] scope
  # @return [Shoe] next shoe
  def previous_shoe(order_criteria = :name, scope = Shoe)
    scope.order(order_criteria).where("#{order_criteria} < ?", self.send(order_criteria)).last
  end

  # @return [String] campaign name
  def campaign
    "#{season_name}-#{year}"
  end

  # sets campaign name, year and season_name
  def campaign=(string)
    self.year, self.season_name = self.class.parse_campaign_name(string)
  end

  # scopes shoes that belong to a given campaign
  # @return [Scope]
  def self.by_campaign(campaign)
    q_year, q_season_name = parse_campaign_name(campaign)
    where(:year => q_year, :season_name => q_season_name)
  end

  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "124x124>" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "shoe/photo/:style/:id/:filename"

  has_attached_file :photo_manual_thumb,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "shoe/photo_manual_thumb/:style/:id/:filename"

  private
  # parses string to get season_name and year
  # @return [Array] [year, season_name]
  def self.parse_campaign_name(string)
    string.match(/(#{SEASON_NAMES.join('|')})-(\d{4})/)
    return $2, $1
  end
end
