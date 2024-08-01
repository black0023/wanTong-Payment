/**
  @author: Black
  @date: 2024/8/1 14:41
  @note:
**/

package payCommon

import "time"

const (
	TimeFormatDate            = "2006-01-02"
	TimeFormatDateNotDash     = "20060102"
	TimeFormatTimeNotDash     = "20060102150405"
	TimeFormatDateTime        = "2006-01-02 15:04:05"
	TimeFormatDateTimeZone    = "2006-01-02T15:04:05+8:00"
	TimeFormatDateTimeNoYear  = "01-02 15:04:05"
	TimeFormatDateTimeNoYear2 = "01-02 15:04"
	TimeFormatTimeNoSec       = "15:04"
)

func GetCurrWeekMonday() time.Time {
	currTime := time.Now()
	currTime = GetDateByString(currTime.Format(TimeFormatDate))
	switch currTime.Weekday() {
	case time.Monday:
		return currTime
	case time.Tuesday:
		return currTime.AddDate(0, 0, -1)
	case time.Wednesday:
		return currTime.AddDate(0, 0, -2)
	case time.Thursday:
		return currTime.AddDate(0, 0, -3)
	case time.Friday:
		return currTime.AddDate(0, 0, -4)
	case time.Saturday:
		return currTime.AddDate(0, 0, -5)
	case time.Sunday:
		return currTime.AddDate(0, 0, -6)
	}
	return currTime
}

func GetCurrMonthFirstDay() time.Time {
	currTime := GetDateByString(time.Now().Format(TimeFormatDate))
	if currTime.Day() == 1 {
		return currTime
	}

	return currTime.AddDate(0, 0, -(currTime.Day() - 1))
}

func TodayIsWeekend() bool {
	currTime := time.Now()
	if currTime.Weekday() == time.Sunday ||
		currTime.Weekday() == time.Saturday {
		return true
	}
	return false
}

func GetDateWeek(dateTime time.Time) string {
	switch dateTime.Weekday() {
	case time.Monday:
		return "周一"
	case time.Tuesday:
		return "周二"
	case time.Wednesday:
		return "周三"
	case time.Thursday:
		return "周四"
	case time.Friday:
		return "周五"
	case time.Saturday:
		return "周六"
	case time.Sunday:
		return "周日"
	}
	return ""
}

func GetWeekByNum(num int) time.Weekday {
	switch num {
	case 1:
		return time.Monday
	case 2:
		return time.Tuesday
	case 3:
		return time.Wednesday
	case 4:
		return time.Thursday
	case 5:
		return time.Friday
	case 6:
		return time.Saturday
	case 7:
		return time.Sunday
	}
	return time.Monday
}

/*GetTimestampMillion
 * @Description: 获取时间戳 - 毫秒
 * @return int64
 */
func GetTimestampMillion() int64 {
	return time.Now().UnixNano() / 1e6
}

func GetTimestampMillionByTime(value time.Time) int64 {
	return value.UnixNano() / 1e6
}

func GetTimeByMillionTimestamp(timestamp int64) time.Time {
	t := time.Unix(timestamp/1e3, 0)
	return t
}

func GetTimeByTimestamp(timestamp int64) time.Time {
	t := time.Unix(timestamp, 0)
	return t
}

func GetTimeDays(value time.Time) int {
	return int(value.Unix() / 86400)
}

func GetTimeByDateTime(value time.Time, hour, min, sec int) time.Time {
	return time.Date(value.Year(), value.Month(), value.Day(), hour, min, sec, 0, time.Local)
}

func DateEqual(date1, date2 time.Time) bool {
	y1, m1, d1 := date1.Date()
	y2, m2, d2 := date2.Date()
	return y1 == y2 && m1 == m2 && d1 == d2
}

func GetTimestampByString(timeStr string) time.Time {
	resultTime, _ := time.ParseInLocation(TimeFormatDateTime, timeStr, time.Local)
	return resultTime
}

func GetDateByString(timeStr string) time.Time {
	resultTime, _ := time.ParseInLocation(TimeFormatDate, timeStr, time.Local)
	return resultTime
}

func GetTimeStrByTimestamp(timestamp int64) string {
	tTime := GetTimeByTimestamp(timestamp)
	return tTime.Format(TimeFormatDateTime)
}

func DateTimeToDateNotDash(timeValue string) string {
	tradeDateTime, _ := time.ParseInLocation(TimeFormatDateTime, timeValue, time.Local)
	return tradeDateTime.Format(TimeFormatDateNotDash)
}
