/* Copyright 2013-present Barefoot Networks, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Srikrishna Gopu (krishna@barefootnetworks.com)
 * Antonin Bas (antonin@barefootnetworks.com)
 *
 */

namespace cpp bm_runtime.simple_pre_lag
namespace py bm_runtime.simple_pre_lag

typedef i32 BmMcMgrp
typedef i32 BmMcRid
typedef i32 BmMcMgrpHandle
typedef i32 BmMcL1Handle
typedef i16 BmMcLagIndex
typedef string BmMcPortMap // string of 0s and 1s
typedef string BmMcLagMap // string of 0s and 1s

enum McOperationErrorCode {
  TABLE_FULL = 1,
  INVALID_HANDLE = 2,
  INVALID_MGID = 3,
  INVALID_L1_HANDLE = 4,
  INVALID_L2_HANLDE = 5,
  ERROR = 6
}

exception InvalidMcOperation {
  1:McOperationErrorCode what
}

service SimplePreLAG {

  BmMcMgrpHandle bm_mc_mgrp_create(
    1:BmMcMgrp mgrp
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_mgrp_destroy(
    1:BmMcMgrpHandle mgrp_handle
  ) throws (1:InvalidMcOperation ouch),

  BmMcL1Handle bm_mc_node_create(
    1:BmMcRid rid,
    2:BmMcPortMap port_map,
    3:BmMcLagMap lag_map
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_node_associate(
    1:BmMcMgrpHandle mgrp_handle,
    2:BmMcL1Handle l1_handle
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_node_dissociate(
    1:BmMcMgrpHandle mgrp_handle,
    2:BmMcL1Handle l1_handle
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_node_destroy(
    1:BmMcL1Handle l1_handle
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_node_update(
    1:BmMcL1Handle l1_handle,
    2:BmMcPortMap port_map,
    3:BmMcLagMap lag_map
  ) throws (1:InvalidMcOperation ouch),

  void bm_mc_set_lag_membership(
    1:BmMcLagIndex lag_index,
    2:BmMcPortMap port_map
  ) throws (1:InvalidMcOperation ouch),
}
