class Functionary # rubocop:disable Style/Documentation, Style/FrozenStringLiteralComment
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def tax_percentage
    return 0 if salary <= 850

    if salary >= 850 && salary <= 1200
      salary * 0.9
    else
      salary * 0.8
    end
  end

  def valid?
    validate_name && validate_salary
  end

  def to_s
    "Name #{name}, salary #{salary.round(2)} tax percent #{tax_percentage.round(2)}, final value #{with_discount}"
  end

  private

  def validate_name
    return false if @name.nil?
    return false if @name.blank?
    return false if @name.size <= 1

    true
  end

  def validate_salary
    return false if @salary.nil?
    return false if @salary.blank?
    return false if @salary.size <= 1

    true
  end

  def with_discount
    (salary - tax_percentage).round(2)
  end
end
