# SPDX-License-Identifier: Apache-2.0
#
# The OpenSearch Contributors require contributions made to
# this file be licensed under the Apache-2.0 license or a
# compatible open source license.
#
# Modifications Copyright OpenSearch Contributors. See
# GitHub history for details.
#
# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module OpenSearch
  module API
    module Cluster
      module Actions
        # Returns a list of any cluster-level changes (e.g. create index, update mapping,
        # allocate or fail shard) which have not yet been executed.
        #
        # @option arguments [Boolean] :local Return local information, do not retrieve the state from cluster_manager node (default: false)
        # @option arguments [Time] :master_timeout (DEPRECATED: use cluster_manager_timeout instead) Specify timeout for connection to master
        # @option arguments [Time] :cluster_manager_timeout Specify timeout for connection to cluster_manager
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        #
        def pending_tasks(arguments = {})
          headers = arguments.delete(:headers) || {}

          arguments = arguments.clone

          method = OpenSearch::API::HTTP_GET
          path   = "_cluster/pending_tasks"
          params = Utils.__validate_and_extract_params arguments, ParamsRegistry.get(__method__)

          body = nil
          perform_request(method, path, params, body, headers).body
        end

        # Register this action with its valid params when the module is loaded.
        #
        # @since 6.2.0
        ParamsRegistry.register(:pending_tasks, [
          :local,
          :master_timeout,
          :cluster_manager_timeout
        ].freeze)
      end
    end
  end
end
