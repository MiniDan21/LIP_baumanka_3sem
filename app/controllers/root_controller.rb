# frozen_string_literal: true

# This class - controller for work with pages input and show
class RootController < ApplicationController
  before_action :check, only: [:show]
  def input
    if params[:query].nil?
      redirect_to root_path, notice: 'Empty parameter'
      return
    end
  end

  def show
    generate_arr
  end

  private

  def check
    if params[:query].nil?
      redirect_to root_path, notice: 'Empty parameter'
      return
    end
    redirect_to root_path, notice: 'Должно быть указано целое число!' unless params[:query].match?(/^[\n ]*[1-9]\d*[ \n]*$/)
    @arr = []
    @number = params[:query].to_i
  end

  def find(value)
    arr = [1]
    (2..value**0.5).each do |i|
      if (value % i).zero?
        arr << i
        arr << value / i unless i == value / i
      end
    end
    arr
  end

  def generate_arr
    string = @number
    nums = Array.new
    val = string.to_i
    (1..val).each do |n|
      s_n = n.to_s
      len_n = s_n.length
      if n == n**2 % (10 ** len_n)
        nums.push(n)
      end
    end
    @arr = nums
  end
end
