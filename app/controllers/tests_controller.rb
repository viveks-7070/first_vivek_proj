class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = test.new(test_params)
    if @test.valid?
      @test.save
      redirect_to tests_path
    else
      render 'new'
    end
  end

  private

  def test_params
    params.require(:tests).permit(:name)
  end
end
