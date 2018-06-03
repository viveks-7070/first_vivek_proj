class SamplesController < ApplicationController
  def index
    # @samples = Sample.all
  end

  def new
    @sample = Sample.new
  end

  def crearte
    @sample = Sample.new(sample_params)
    if @sample.save
      redirect_to tests_path
    else
      render 'new'
    end
  end

  private

  def sample_params
    params.require(:sample).permit(:sample_name)
  end
end
