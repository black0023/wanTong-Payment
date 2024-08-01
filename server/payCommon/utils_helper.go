/**
  @author: Black
  @date: 2024/7/25 16:52
  @note:
**/

package payCommon

import (
	"math/rand"
	"time"
)

func RandomRange(start, end int) int {
	if start >= end {
		return start
	}

	s := rand.NewSource(time.Now().UnixNano())
	r := rand.New(s)
	return r.Intn((end+1)-start) + start
}
