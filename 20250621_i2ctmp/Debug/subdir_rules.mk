################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Users/camilochiang/ti/ti_cgt_tiarmclang_3.2.2.LTS/bin/tiarmclang" -c -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mlittle-endian -mthumb -Oz -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp" -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp/Debug" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/source" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/kernel/tirtos7/packages" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/source/ti/posix/ticlang" -gdwarf-3 -march=armv7e-m -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

build-1475773967: ../i2ctmp.syscfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: SysConfig'
	"/Users/camilochiang/ti/sysconfig_1.21.1/sysconfig_cli.sh" --script "/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp/i2ctmp.syscfg" -o "syscfg" -s "/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/.metadata/product.json" --compiler ticlang
	@echo 'Finished building: "$<"'
	@echo ' '

syscfg/ti_devices_config.c: build-1475773967 ../i2ctmp.syscfg
syscfg/ti_drivers_config.c: build-1475773967
syscfg/ti_drivers_config.h: build-1475773967
syscfg/ti_utils_build_linker.cmd.genlibs: build-1475773967
syscfg/ti_utils_build_linker.cmd.genmap: build-1475773967
syscfg/ti_utils_build_compiler.opt: build-1475773967
syscfg/syscfg_c.rov.xs: build-1475773967
syscfg/ti_sysbios_config.h: build-1475773967
syscfg/ti_sysbios_config.c: build-1475773967
syscfg: build-1475773967

syscfg/%.o: ./syscfg/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Users/camilochiang/ti/ti_cgt_tiarmclang_3.2.2.LTS/bin/tiarmclang" -c -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mlittle-endian -mthumb -Oz -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp" -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp/Debug" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/source" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/kernel/tirtos7/packages" -I"/Users/camilochiang/ti/simplelink_cc13xx_cc26xx_sdk_8_30_01_01/source/ti/posix/ticlang" -gdwarf-3 -march=armv7e-m -MMD -MP -MF"syscfg/$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/camilochiang/Documents/tmp/CC2652/20250621_i2ctmp/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


