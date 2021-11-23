# finding out includes of usbd_ble_uart_freertos project 
ref_string="BOARD_PCA10056;CONFIG_GPIO_AS_PINRESET;FLOAT_ABI_HARD;FREERTOS;INITIALIZE_USER_SECTIONS;NO_VTOR_CONFIG;NRF52840_XXAA;"
ref_items = String.split(ref_string, ";")
ref_items = ref_items |> Enum.sort()
IO.puts("------------------ ref ---------------------------")
#Enum.each(ref_items, fn x -> IO.puts(x) end)

target_string="APP_TIMER_V2;APP_TIMER_V2_RTC1_ENABLED;BOARD_PCA10056;CONFIG_GPIO_AS_PINRESET;FLOAT_ABI_HARD;INITIALIZE_USER_SECTIONS;NO_VTOR_CONFIG;NRF52840_XXAA;NRF_SD_BLE_API_VERSION=7;S140;SOFTDEVICE_PRESENT"
target_items = String.split(target_string, ";")
target_items = target_items |> Enum.sort()
IO.puts("------------------ target ---------------------------")
#Enum.each(target_items, fn x -> IO.puts(x) end)

# concat the two list and prepare target items 
concated_items      = ref_items ++ target_items 
concated_uniq_items = concated_items |> Enum.uniq()
concated_uniq_items = concated_uniq_items |> Enum.sort()
IO.puts("------------------ concated_uniq ---------------------------")
# Enum.each(concated_uniq_items, fn x -> IO.puts(x) end)

# added items 
added_items = concated_uniq_items -- target_items
added_items = added_items |> Enum.sort()
IO.puts("------------------ added / diff---------------------------")
# Enum.each(added_items, fn x -> IO.puts(x) end)

# string to add
added_items_string = Enum.join( added_items, ";")
IO.puts("------------------ add string---------------------------")
IO.puts(added_items_string)