/**
  @author: Black
  @date: 2024/8/5 21:28
  @note:
**/

package payCommon

import (
	"strconv"
)

func AToI64(str string) int64 {
	if str == "" {
		return 0
	}
	value, err := strconv.ParseInt(str, 10, 64)
	if err != nil {
		return 0
	}
	return value
}
