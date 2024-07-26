/**
  @author: Black
  @date: 2024/7/25 16:47
  @note:
**/

package payCommon

import "fmt"

func RandomMerchantNo() string {
	return fmt.Sprintf("M168%05d", RandomRange(1, 99999))
}
