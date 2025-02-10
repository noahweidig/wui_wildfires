# WUI Area

wui <- st_read(dsn = "~/OneDrive - University of Florida/Thesis/silvis_wui/CONUS_WUI_block_1990_2020_change_v4_web.gdb/",
               layer = "CONUS_WUI_block_1990_2020_change_v4")

wui_area <- read_csv("C:/Users/noah.weidig/OneDrive - University of Florida/Thesis/large_files/wui_area.csv")

wui_area_sum_l1 <- wui_area %>%
  summarise(area           = (sum(Shape_Area)/1e6),
            interface_1990 = (sum(Shape_Area[WUIFLAG1990 == 2]) /
                                sum(Shape_Area)),
            intermix_1990  = (sum(Shape_Area[WUIFLAG1990 == 1]) /
                                sum(Shape_Area)),
            interface_2000 = (sum(Shape_Area[WUIFLAG2000 == 2]) /
                                sum(Shape_Area)),
            intermix_2000  = (sum(Shape_Area[WUIFLAG2000 == 1]) /
                                sum(Shape_Area)),
            interface_2010 = (sum(Shape_Area[WUIFLAG2010 == 2]) /
                                sum(Shape_Area)),
            intermix_2010  = (sum(Shape_Area[WUIFLAG2010 == 1]) /
                                sum(Shape_Area)),
            interface_2020 = (sum(Shape_Area[WUIFLAG2020 == 2]) /
                                sum(Shape_Area)),
            intermix_2020  = (sum(Shape_Area[WUIFLAG2020 == 1]) /
                                sum(Shape_Area))) %>%
  pivot_longer(cols = 2:9, names_to ="wui_year", values_to = "percent") %>%
  separate(wui_year, c("wui_type", "year"), sep = "_", remove = FALSE) %>%
  subset(select = c(1, 3, 4, 5))

wui_area_sum_l1 %>% write_csv("wui_area_sum_l1.csv")

wui_area_sum_l3 <- wui_area %>%
  group_by(L3_KEY) %>%
  summarise(area           = (sum(Shape_Area)/1e6),
            interface_1990 = (sum(Shape_Area[WUIFLAG1990 == 2]) /
                                sum(Shape_Area)),
            intermix_1990  = (sum(Shape_Area[WUIFLAG1990 == 1]) /
                                sum(Shape_Area)),
            interface_2000 = (sum(Shape_Area[WUIFLAG2000 == 2]) /
                                sum(Shape_Area)),
            intermix_2000  = (sum(Shape_Area[WUIFLAG2000 == 1]) /
                                sum(Shape_Area)),
            interface_2010 = (sum(Shape_Area[WUIFLAG2010 == 2]) /
                                sum(Shape_Area)),
            intermix_2010  = (sum(Shape_Area[WUIFLAG2010 == 1]) /
                                sum(Shape_Area)),
            interface_2020 = (sum(Shape_Area[WUIFLAG2020 == 2]) /
                                sum(Shape_Area)),
            intermix_2020  = (sum(Shape_Area[WUIFLAG2020 == 1]) /
                                sum(Shape_Area))) %>%
  pivot_longer(cols = 3:10, names_to ="wui_year", values_to = "percent") %>%
  separate(wui_year, c("wui_type", "year"), sep = "_", remove = FALSE) %>%
  subset(select = c(1, 2, 4, 5, 6))

wui_area_sum_l3 %>%
  write_csv("wui_area_sum_l3.csv")


