#!/system/bin/sh
# This script is needed to automatically set device props.

load_surya()
{
    resetprop "ro.product.model" "M2007J20CG"
    resetprop "ro.product.vendor.model" "M2007J20CG"
    resetprop "ro.product.name" "surya"
    resetprop "ro.build.product" "surya"
    resetprop "ro.product.device" "surya"
    resetprop "ro.product.system.device" "surya"
    resetprop "ro.product.vendor.device" "surya"
    resetprop "ro.vendor.product.device" "surya"
}

load_karna()
{
    resetprop "ro.product.model" "M2007J20CI"
    resetprop "ro.product.vendor.model" "M2007J20CI"
    resetprop "ro.product.name" "karna"
    resetprop "ro.build.product" "karna"
    resetprop "ro.product.device" "karna"
    resetprop "ro.product.system.device" "karna"
    resetprop "ro.product.vendor.device" "karna"
    resetprop "ro.vendor.product.device" "karna"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "GLOBAL")
        load_surya
        ;;
    "INDIA")
        load_karna
        ;;
    *)
        load_surya
        ;;
esac

exit 0
