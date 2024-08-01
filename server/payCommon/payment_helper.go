/**
  @author: Black
  @date: 2024/8/1 16:16
  @note:
**/

package payCommon

import (
	"fmt"
	"math/rand"
	"time"
)

/*GenerateUniqueOrderID
 * @Description: 生成唯一订单号
 * @return string
 */
func GenerateUniqueOrderID() string {
	timestamp := time.Now().UnixNano() / 1e6
	randomNum := rand.Intn(100000)
	return fmt.Sprintf("%d%09d", timestamp, randomNum)
}
