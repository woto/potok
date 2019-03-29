class RateForm

  extend ActiveModel::Callbacks
  include ActiveModel::Validations
  attr_accessor :from, :to
  validates :from, :to, presence: true

  def initialize(params = {})
    self.from = params[:from]
    self.to = params[:to]
  end

  def from=(from)
    @from = Time.zone.parse(from) if from
  end

  def to=(to)
    @to = Time.zone.parse(to) if to
  end

end
