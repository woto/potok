class Ajax::RatesController < ApplicationController

  def index
    form = RateForm.new(params)
    respond_to do |format|

      catch :exit do
        unless form.valid?
          format.json { render json: form.errors, status: :unprocessable_entity } and throw :exit
        end

        rates = Ajax::RatesService.new(form)
        unless rates.exists?
          format.json { render json: { "error": ["data missed"] }, status: :unprocessable_entity } and throw :exit
        end

        format.json { render json: rates.graph }
      end
    end
  end
end
