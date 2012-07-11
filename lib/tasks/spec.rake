desc 'Run all specs in spec directory (excluding plugin specs)'
task spec: [:build_artifacts]

task build_artifacts: [:stats] do
  system 'rails_best_practices --spec -x schema,devise,secret'
end
