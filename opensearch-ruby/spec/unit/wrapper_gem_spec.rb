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
require 'opensearch'
require 'webmock/rspec'

describe 'OpenSearch: wrapper gem' do
  it 'requires all neccessary subgems' do
    expect(defined?(OpenSearch::Client))
    expect(defined?(OpenSearch::API))
  end

  it 'mixes the API into the client' do
    client = OpenSearch::Client.new

    expect(client).to respond_to(:search)
    expect(client).to respond_to(:cluster)
    expect(client).to respond_to(:indices)
  end

  it 'can access the client transport' do
    client = OpenSearch::Client.new
    expect(client.transport).to be_a(OpenSearch::Transport::Client)
    expect(client.transport.transport).to be_a(OpenSearch::Transport::Transport::HTTP::Faraday)
  end
end
