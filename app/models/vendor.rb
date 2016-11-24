class Vendor < ActiveRecord::Base
  include PublicActivity::Common
  searchkick
  has_one :user, as: :account

  has_many :accepted_payment_methods, dependent: :destroy
  has_many :payment_methods, through: :accepted_payment_methods
  has_many :galleries, as: :owner, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :physical_locations, dependent: :destroy
  has_many :cities, through: :physical_locations, dependent: :destroy
  has_many :vendor_subscriptions, dependent: :destroy
  has_many :delivery_locations, dependent: :destroy
  has_many :service_locations, dependent: :destroy
  has_many :external_links, dependent: :destroy
  has_many :attachments, as: :owner, dependent: :destroy
  has_many :subcategories, through: :vendor_subscriptions
  has_many :personal_infos, dependent: :destroy

  accepts_nested_attributes_for :physical_locations,
    reject_if: lambda { |a| a[:address].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :vendor_subscriptions,
    reject_if: lambda { |a| a[:subcategory_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :delivery_locations,
    reject_if: lambda { |a| a[:city_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :service_locations,
    reject_if: lambda { |a| a[:city_id].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :external_links,
    reject_if: lambda { |a| a[:link].blank? },
    allow_destroy: true
  accepts_nested_attributes_for :attachments,
    allow_destroy: true
  accepts_nested_attributes_for :personal_infos,
    allow_destroy: true
  accepts_nested_attributes_for :accepted_payment_methods,
    allow_destroy: true

  def total_raiting

    @total = 0
    if self.reviews.length > 0
      self.reviews.each do |r|
        if r.raiting != nil
          @total += r.raiting
        end
      end
      @total = @total/self.reviews.length
      return @total
    else
      return 0
    end
  end
  def cover_pic
    if self.galleries.where(name: "Cover_Pictures").empty?
      return nil
    else
      if self.galleries.where(name: "Cover_Pictures").first.attachments.empty?
        return nil
      else
        return self.galleries.where(name: "Cover_Pictures").first.attachments.last
      end
    end
  end
  def media
    if self.galleries.where(name: "Media").empty?
      return nil
    else
      return self.galleries.where(name: "Media").first
    end
  end
end
