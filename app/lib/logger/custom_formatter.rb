class Logger::CustomFormatter < SemanticLogger::Formatters::Json
  def initialize
    super(time_format: :iso_8601, log_host: false, log_application: false, time_key: :timestamp)
  end

  def level
    # skip :level_index
    hash[:level] = log.level
  end

  def duration
    # skip :duration  as duration_human
    hash[:duration] = log.duration if log.duration
  end
end
