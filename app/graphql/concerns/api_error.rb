module ApiError
  ERROR_CODE_MSG = {
    resource_not_found: "not found",
    record_invalid: "invalid",
    record_not_unique: "not unique",
    record_not_destroyed: "not destroyed"
  }
  def self.format_error(code:, message: nil)
    error_msg = message || ERROR_CODE_MSG[code]

    GraphQL::ExecutionError.new(error_msg, extensions: { code: code })
  end

  def format_error(code:, message: nil)
    ApiError.format_error(code: code, message: message)
  end
end
