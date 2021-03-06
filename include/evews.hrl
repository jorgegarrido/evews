% ==========================================================================================================
% 
% EvE ws
%
% Copyright (C) 2013, Jorge Garrido <zgbjgg@gmail.com>. 
% All rights reserved.
%
% BSD License
%
% Redistribution and use in source and binary forms, with or without modification, are permitted provided
% that the following conditions are met:
%
%  * Redistributions of source code must retain the above copyright notice, this list of conditions and the
%        following disclaimer.
%  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
%        the following disclaimer in the documentation and/or other materials provided with the distribution.
%  * Neither the name of the authors nor the names of its contributors may be used to endorse or promote
%        products derived from this software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
% WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
% ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
% TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
% ==========================================================================================================
-ifdef(debug_logging).
-define(LOG_DEBUG(Msg, Args), error_logger:info_msg("(~p):[DEBUG EVEWS]\n " ++ Msg ++ "\n", [self() | Args])).
-else.
-define(LOG_DEBUG(Msg, Args), ok).
-endif.
-define(TCP_OPTIONS,[binary, inet, {packet, raw}, {active, false}, {reuseaddr, true}]).
-define(FRAME(Fin, Rsv1, Rsv2, Rsv3, Opcode, MaskBit, PayloadLen, MaskKey, PayloadData, Rest), [{fin, Fin}, {rsv1, Rsv1}, 
												{rsv2, Rsv2}, {rsv3, Rsv3}, 
												{opcode, Opcode}, 
												{mask_bit, MaskBit}, 
												{payload_len, PayloadLen}, 
											   	{mask_key, MaskKey},
												{payload_data, PayloadData}, 
												{rest, Rest}]).
