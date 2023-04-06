<template>
	<view class="page_notice" id="notice_details">
		<!-- 公告模块(开始) -->
		<mm_warp>
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="notice_view">
							<view class="title">
								{{obj.title}}
							</view>
							<view class="time">
								{{ $toTime(obj.create_time,'yyyy-MM-dd hh:mm:ss')}}
							</view>
							<view class="content" style="text-align: left;">
								<rich-text :nodes="obj.content"></rich-text>
							</view>
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 公告模块(结束) -->
	</view>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				url_get_obj: "~/api/notice/get_obj?",
				field: "notice_id",
				query: {
					notice_id: 0
				},
				href: 'https://uniapp.dcloud.io/component/README?id=uniui',
				obj: {
					title:"标题",
					create_time:"时间",
					content:"文本"
				}
			}
		},
		methods: {
			get_obj_after(json) {
				console.log(JSON.stringify(json));
			}
		}
	}
</script>

<style>
	#notice_details .mm_container{
		background-color: #fff;
	}
	#notice_details .page_notice {
		text-align: center;
	}

	#notice_details .page_notice>view {
		margin-top: 1rem;
	}

	#notice_details .title {
		font-size: 1.3rem;
	}

	#notice_details .time {
		color: var(--color_grey);
	}
</style>
