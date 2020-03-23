module CommonActions
  extend ActiveSupport::Concern

  def set_categories
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

end 