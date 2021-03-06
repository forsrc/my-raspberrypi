#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x8eec8993, "module_layout" },
	{ 0xc138135f, "usb_register_driver" },
	{ 0xef6bfb45, "__napi_schedule" },
	{ 0x85df9b6c, "strsep" },
	{ 0x2fbf8927, "eth_type_trans" },
	{ 0x946cf2d6, "napi_gro_receive" },
	{ 0xda4a6eac, "single_release" },
	{ 0x9f49dcc4, "__stack_chk_fail" },
	{ 0xd2da1048, "register_netdevice_notifier" },
	{ 0x98cf60b3, "strlen" },
	{ 0xc7954d8e, "skb_queue_tail" },
	{ 0x22253799, "cfg80211_rx_mgmt_khz" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0x20000329, "simple_strtoul" },
	{ 0x3451ea65, "cfg80211_mgmt_tx_status" },
	{ 0x4829a47e, "memcpy" },
	{ 0x571b1c5b, "proc_mkdir_data" },
	{ 0x1d5b2b4b, "dev_get_by_name" },
	{ 0x9089d584, "wiphy_apply_custom_regulatory" },
	{ 0x3c3ff9fd, "sprintf" },
	{ 0x31c24ab7, "napi_disable" },
	{ 0x12a4e128, "__arch_copy_from_user" },
	{ 0xa59b2579, "free_netdev" },
	{ 0x13728bed, "__cfg80211_alloc_reply_skb" },
	{ 0x22f48775, "unregister_netdevice_queue" },
	{ 0x2d3385d3, "system_wq" },
	{ 0xa51a41d8, "__pskb_copy_fclone" },
	{ 0xef464c28, "getboottime64" },
	{ 0x3cc61d71, "usb_submit_urb" },
	{ 0xb5b54b34, "_raw_spin_unlock" },
	{ 0x6043b588, "netif_receive_skb" },
	{ 0x760a0f4f, "yield" },
	{ 0x409bcb62, "mutex_unlock" },
	{ 0xe0fabdc2, "alloc_etherdev_mqs" },
	{ 0xa449a25b, "usb_free_urb" },
	{ 0x1ea8fa1, "cfg80211_new_sta" },
	{ 0x8d522714, "__rcu_read_lock" },
	{ 0x80d24e3f, "unregister_netdev" },
	{ 0xf9a482f9, "msleep" },
	{ 0x94eef82c, "flush_signals" },
	{ 0x9d0d6206, "unregister_netdevice_notifier" },
	{ 0xc9b27f7d, "cfg80211_inform_bss_frame_data" },
	{ 0x2469810f, "__rcu_read_unlock" },
	{ 0x25974000, "wait_for_completion" },
	{ 0x9ea53d7f, "vsnprintf" },
	{ 0xd7f61106, "dev_alloc_name" },
	{ 0xc289770, "usb_kill_urb" },
	{ 0x34db050b, "_raw_spin_lock_irqsave" },
	{ 0xe8639e2b, "netif_carrier_on" },
	{ 0x9d312b7, "cfg80211_unlink_bss" },
	{ 0x2bf425e1, "__dev_kfree_skb_any" },
	{ 0x12fb75ca, "proc_create_data" },
	{ 0xbaccf240, "find_vpid" },
	{ 0x3fefdd2c, "usb_alloc_coherent" },
	{ 0x1000e51, "schedule" },
	{ 0x9200ce4c, "skb_push" },
	{ 0x4a3ad70e, "wait_for_completion_timeout" },
	{ 0xf1969a8e, "__usecs_to_jiffies" },
	{ 0x6df1aaf1, "kernel_sigaction" },
	{ 0xfe1887e6, "kill_pid" },
	{ 0xa1201f2f, "skb_trim" },
	{ 0xe2959adc, "cfg80211_connect_done" },
	{ 0x97934ecf, "del_timer_sync" },
	{ 0xc3690fc, "_raw_spin_lock_bh" },
	{ 0x60b7b3fe, "netif_napi_add" },
	{ 0xcf2a6966, "up" },
	{ 0xfe029963, "unregister_inetaddr_notifier" },
	{ 0xaeca0925, "register_netdev" },
	{ 0xb517cd7f, "cfg80211_put_bss" },
	{ 0x22ad54ff, "cfg80211_roamed" },
	{ 0xf68285c0, "register_inetaddr_notifier" },
	{ 0x93a122ab, "remove_proc_entry" },
	{ 0x15ba50a6, "jiffies" },
	{ 0xf67ef13b, "cfg80211_scan_done" },
	{ 0x608741b5, "__init_swait_queue_head" },
	{ 0xb3f7646e, "kthread_should_stop" },
	{ 0x2ab7989d, "mutex_lock" },
	{ 0x977f511b, "__mutex_init" },
	{ 0x8ddd8aad, "schedule_timeout" },
	{ 0x41fa7b7a, "napi_complete_done" },
	{ 0x291e0c68, "seq_read" },
	{ 0xb5136dc7, "mutex_lock_interruptible" },
	{ 0xe1650ec4, "netif_carrier_off" },
	{ 0x6a568732, "usb_get_dev" },
	{ 0xce8c85a4, "cpu_hwcap_keys" },
	{ 0x1ef581a8, "param_ops_uint" },
	{ 0x6dd4a3dc, "kthread_create_on_node" },
	{ 0x596e2931, "wake_up_process" },
	{ 0xc45f6b25, "register_netdevice" },
	{ 0xd5e16e48, "seq_lseek" },
	{ 0xe3e6c78, "PDE_DATA" },
	{ 0x5c5a7008, "skb_copy" },
	{ 0x3fc5e898, "param_ops_charp" },
	{ 0x8f678b07, "__stack_chk_guard" },
	{ 0xc38c83b8, "mod_timer" },
	{ 0x6e2798c9, "skb_copy_bits" },
	{ 0x9166fada, "strncpy" },
	{ 0x250d0ad5, "cfg80211_ibss_joined" },
	{ 0xb13a4d7a, "netif_rx" },
	{ 0xea3c74e, "tasklet_kill" },
	{ 0x682ac104, "usb_deregister" },
	{ 0x52f30d9c, "skb_dequeue" },
	{ 0xc284b945, "cfg80211_michael_mic_failure" },
	{ 0x753b16bc, "netif_tx_wake_queue" },
	{ 0x26cc73c3, "complete_and_exit" },
	{ 0xea86916b, "cfg80211_disconnected" },
	{ 0x4d65cbd5, "csum_ipv6_magic" },
	{ 0x57e942f3, "kthread_stop" },
	{ 0xfda9581f, "prandom_u32" },
	{ 0x3e3bad0a, "__tasklet_hi_schedule" },
	{ 0x56470118, "__warn_printk" },
	{ 0x9a1dfd65, "strpbrk" },
	{ 0xb29ecad9, "init_net" },
	{ 0x4e2929c8, "__cfg80211_send_event_skb" },
	{ 0x6bedf402, "ieee80211_freq_khz_to_channel" },
	{ 0x96b29254, "strncasecmp" },
	{ 0x349cba85, "strchr" },
	{ 0x37a0cba, "kfree" },
	{ 0xae80297c, "seq_printf" },
	{ 0xa6257a2f, "complete" },
	{ 0xdd32f30a, "cfg80211_get_bss" },
	{ 0x71e0e190, "wiphy_new_nm" },
	{ 0x42369bc9, "param_array_ops" },
	{ 0x11fd7af2, "wiphy_free" },
	{ 0xc5b6f236, "queue_work_on" },
	{ 0x1e6d26a8, "strstr" },
	{ 0xe46021ca, "_raw_spin_unlock_bh" },
	{ 0x81c77735, "seq_open" },
	{ 0x609f1c7e, "synchronize_net" },
	{ 0xf2a4da36, "__netif_napi_del" },
	{ 0x6bd0e573, "down_interruptible" },
	{ 0x45ac0b60, "proc_get_parent_data" },
	{ 0xb2e29ec3, "kernel_read" },
	{ 0xa742c851, "skb_put" },
	{ 0xe113bbbc, "csum_partial" },
	{ 0x9f984513, "strrchr" },
	{ 0x5a9e87af, "cfg80211_ready_on_channel" },
	{ 0x12a38747, "usleep_range" },
	{ 0xe914e41e, "strcpy" },
	{ 0x7f02188f, "__msecs_to_jiffies" },
	{ 0xbf3dd994, "skb_clone" },
	{ 0x5a921311, "strncmp" },
	{ 0xd17c0815, "ieee80211_get_channel_khz" },
	{ 0x1abf41fd, "usb_put_dev" },
	{ 0x29a41b9, "filp_close" },
	{ 0xd35cce70, "_raw_spin_unlock_irqrestore" },
	{ 0x5a9f1d63, "memmove" },
	{ 0xae6ef773, "cfg80211_ch_switch_notify" },
	{ 0x14b89635, "arm64_const_caps_ready" },
	{ 0x5a30e27f, "usb_control_msg" },
	{ 0x38b22100, "param_ops_int" },
	{ 0x61e60998, "napi_schedule_prep" },
	{ 0xc6f46339, "init_timer_key" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xa7332d32, "single_open" },
	{ 0xdcb764ad, "memset" },
	{ 0xb582dfcd, "__pskb_pull_tail" },
	{ 0xba8fbd64, "_raw_spin_lock" },
	{ 0x3cc6fa80, "usb_alloc_urb" },
	{ 0x9e7d6bd0, "__udelay" },
	{ 0xe2d5255a, "strcmp" },
	{ 0x4f0927a1, "usb_reset_device" },
	{ 0x37befc70, "jiffies_to_msecs" },
	{ 0x20a31065, "filp_open" },
	{ 0x7dbb1bd9, "usb_autopm_get_interface" },
	{ 0x656e4a6e, "snprintf" },
	{ 0x6f9cdc27, "wiphy_unregister" },
	{ 0x8d225036, "seq_release" },
	{ 0xe37a9030, "netif_tx_stop_all_queues" },
	{ 0x5477812d, "cfg80211_del_sta_sinfo" },
	{ 0x2364c85a, "tasklet_init" },
	{ 0x4cba441d, "iwe_stream_add_event" },
	{ 0x393882ab, "cfg80211_vendor_cmd_reply" },
	{ 0xd92da9ef, "usb_autopm_put_interface" },
	{ 0x9d2ab8ac, "__tasklet_schedule" },
	{ 0xf70e4a4d, "preempt_schedule_notrace" },
	{ 0xbcab6ee6, "sscanf" },
	{ 0x283340dd, "__netdev_alloc_skb" },
	{ 0x8249512, "iwe_stream_add_point" },
	{ 0x11089ac7, "_ctype" },
	{ 0xc5850110, "printk" },
	{ 0xd40bd8f9, "nla_put_nohdr" },
	{ 0xd6ee688f, "vmalloc" },
	{ 0xe7029eb9, "cfg80211_remain_on_channel_expired" },
	{ 0x127719a6, "nla_put" },
	{ 0x767148c7, "wiphy_register" },
	{ 0xd26b578, "__cfg80211_alloc_event_skb" },
	{ 0x999e8297, "vfree" },
	{ 0x449ad0a7, "memcmp" },
	{ 0x3c12dfe, "cancel_work_sync" },
	{ 0x6cbbfc54, "__arch_copy_to_user" },
	{ 0x64c28b9f, "usb_free_coherent" },
	{ 0x85670f1d, "rtnl_is_locked" },
	{ 0x27971043, "skb_pull" },
};

MODULE_INFO(depends, "cfg80211");

MODULE_ALIAS("usb:v0BDApB82Bd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApB820d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC821d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC820d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC82Ad*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC82Bd*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDApC811d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDAp8811d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v0BDAp2006d*dc*dsc*dp*icFFiscFFipFFin*");
MODULE_ALIAS("usb:v2001p331Dd*dc*dsc*dp*ic*isc*ip*in*");

MODULE_INFO(srcversion, "A8C425230E9886754440D6D");
