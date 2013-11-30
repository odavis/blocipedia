class Wiki < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :topic, :privacy
  validates :description, presence: true 
  validates :topic, presence: true  
  validates :topic, length: { maximum: 40 }
  validates :description, length: { maximum: 140 }
  has_many :articles, dependent: :destroy 

  extend FriendlyId
  friendly_id :topic, use: :history 

  #scope :visible_to, where(privacy: true) 
  #scope :visible_to, lambda { |use| user ? scoped : where(privacy: false) }

#  before_filter :find_wiki
#  
#  private
#  def find_wiki
#    @wiki = Wiki.find(params[:id])
#    if request.path != wiki_path(@wiki)
#      return redirect_to @wiki, :status => :moved_permanently
#    end
#  end

end
