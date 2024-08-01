/**
  @author: Black
  @date: 2024/8/1 14:39
  @note:
**/

package payCommon

import (
	"crypto/md5"
	"encoding/hex"
	"strings"
)

func Md5String(str string) string {
	h := md5.New()
	h.Write([]byte(str))
	return strings.ToUpper(hex.EncodeToString(h.Sum(nil)))
}
