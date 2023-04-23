<template>
	<view class="list_forum" style="background-color: #fff;">
		<!-- 表格 -->
		<view class="list_forum_table">
			<view class="change_table" @click="show_table()">
				{{ title }}
			</view>
			<view class="forum_table_block" v-show="is_opened">
				<uni-table stripe border emptyText="暂无更多数据">
					<uni-tr>
						<uni-th align="center">图片</uni-th>
						<uni-th align="center">标题</uni-th>
						<uni-th align="center">点击数</uni-th>
						<uni-th align="center">点赞数</uni-th>
						<uni-th align="center">更新时间</uni-th>
					</uni-tr>
					<uni-tr v-for="(o, i) in list" :key="i">
						<uni-td class="image" align="center">
							<image style="width:4rem;height: 4rem;border-radius: 0.5rem;" :src="$fullUrl(o[vm.img]) || '@/static/img/default.png'" mode="scaleToFill">
							</image>
						</uni-td>
						<uni-td class="title" align="center">
							{{ o[vm.title] }}
						</uni-td>
						<uni-td class="hits" align="center">
							{{ o[vm.hits] }}
						</uni-td>
						<uni-td class="praise" align="center">{{ o[vm.praise_len] }}</uni-td>
						<uni-td class="create_time" align="center">{{ $toTime(o[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}</uni-td>
					</uni-tr>
				</uni-table>
			</view>
		</view>
		<!-- /表格 -->
		<view class="forum_block"  v-show="!is_opened">
			<navigator class="item_forum" v-for="(o, i) in list" :key="i" :url="'/pages/forum/details?' + vm.forum_id + '=' + o[vm.forum_id]">
			<view class="left">
				<image style="width:4rem;height: 4rem;" :src="$fullUrl(o[vm.img]) || '@/static/img/default.png'" mode="scaleToFill"></image>
			</view>
			<view class="right_block">
				<view class="top">
					{{ o[vm.title] }}
				</view>
				<view class="time">{{ $toTime(o[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}</view>
				<view class="bottom">
					<text>
						<uni-icons style="font-size: 0.5rem;" type="person" size="20" color="#6a737d">
						</uni-icons>{{o[vm.nickname]}}</text>
					<text>
						<span class="praise">
							{{ o[vm.praise_len] }}点赞
						</span>
						<span class="see">
							{{ o[vm.hits] }}点击
						</span>
					</text>
				</view>
			</view>
		</navigator>
		</view>

	</view>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				}
			},
			vm: {
				type: Object,
				default: function() {
					return {
						img: "img",
						forum_id: "forum_id",
						title: "title",
						description: "description",
						create_time: "create_time",
						content: "content",
						praise_len: "praise_len",
						hits: "hits",
						nickname:"nickname"
					}
				}
			}
		},
		data() {
			return {
				is_opened: false,
				title: '切换成表格'
			}
		},
		methods: {
			show_table() {
				this.is_opened = !this.is_opened
				if (this.is_opened === true) {
					this.title = '切换成列表'
				}
				else{
					this.title= '切换成表格'
				}
			}
		}
	}
</script>

<style scoped>
	.list_forum {
		/* padding: 0 1rem; */
		margin-bottom: 1rem;
	}

	.list_forum .list_forum_table {
		width: 100%;
		padding: 5px 0;
	}

	.list_forum .list_forum_table .change_table {
		font-weight: bold;
		padding: 5px;
		width: 100px;
		font-size: 0.8rem ;
		margin-left: 7px;
	}

	.list_forum .list_forum_table .forum_table_block .uni-table-td{
		padding: 8px;
	}

	.list_forum .list_forum_table .forum_table_block .image {
		width: 10%;
	}

	.list_forum .list_forum_table .forum_table_block .title {
		overflow: hidden;
		width: 30%;
		font-size: 0.5rem;
	}

	.list_forum .list_forum_table .forum_table_block .hits {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_forum .list_forum_table .forum_table_block .praise {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_forum .list_forum_table .forum_table_block .create_time {
		width: 26%;
		font-size: 0.5rem;
	}
	.list_forum .item_forum {
		display: flex;
		justify-content: space-between;
		align-items: stretch;
		padding: 0.75rem 1rem;

	}
	.list_forum .item_forum+.item_forum{
		border-top: 1px solid #dbdbdb;
	}
	.list_forum .item_forum .left>image {
		position: relative;
		top: 50%;
		transform: translate(0, -50%);
		border-radius: 0.5rem;
	}

	.list_forum .item_forum .right_block {
		width: calc(100% - 5rem);
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.list_forum .top {
		font-size: 0.9rem;
	}


	.list_forum .time {
		font-size: 0.6rem;
		color: var(--color_grey)
	}

	.list_forum .bottom {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		font-size: 0.5rem;
		color: var(--color_grey)
	}

	.list_forum .see {
		margin-left: 1rem;
	}
</style>
