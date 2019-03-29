class Rate < ApplicationRecord

  CODES = {
    "840" => "USD",
    "643" => "RUB",
    "978" => "EUR",
    "826" => "GBP"
  }
  REVERSE_CODES = CODES.invert
end
