/**
  @author: Black
  @date: 2024/8/7 18:57
  @note:
**/

package payCommon

import "reflect"

func MatchInterfaceType(data interface{}, dataType string) bool {
	return reflect.TypeOf(data).String() == dataType
}

func GetMapString(data interface{}) string {
	if data == nil {
		return ""
	}

	if !MatchInterfaceType(data, reflect.String.String()) {
		return ""
	}

	return data.(string)
}

func GetMapBool(data interface{}) bool {
	if data == nil {
		return false
	}

	if !MatchInterfaceType(data, reflect.Bool.String()) {
		return false
	}

	return data.(bool)
}

func GetMapFloat(data interface{}) float64 {
	if data == nil {
		return 0.0
	}

	if !MatchInterfaceType(data, reflect.Float64.String()) {
		return 0.0
	}

	return data.(float64)
}

func GetMapInt(data interface{}) int {
	if data == nil {
		return 0
	}

	if !MatchInterfaceType(data, reflect.Float64.String()) {
		return 0
	}

	return int(data.(float64))
}

func GetMapIntNotNull(data interface{}) int {
	if data == nil {
		return -1
	}

	if !MatchInterfaceType(data, reflect.Float64.String()) {
		return -1
	}

	return int(data.(float64))
}

func GetMapInt32(data interface{}) int {
	if data == nil {
		return 0
	}

	if !MatchInterfaceType(data, reflect.Int32.String()) {
		return 0
	}

	return int(data.(int32))
}

func GetMapInt64(data interface{}) int64 {
	if data == nil {
		return 0
	}

	if !MatchInterfaceType(data, reflect.Float64.String()) {
		return 0
	}

	return int64(data.(float64))
}
