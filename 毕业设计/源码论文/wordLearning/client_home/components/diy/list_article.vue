<template>
	<view class="list_article" style="background-color: #fff;">
		<view class="list_article_table">
			<view class="btn_change_table" @click="show_table()">
				{{ title }}
			</view>

			<!-- 表格 -->
			<view class="article_table_block" v-show="is_opened">
				<uni-table stripe border emptyText="暂无更多数据">
					<uni-tr>
						<uni-th align="center" class="uni-th">图片</uni-th>
						<uni-th align="center" class="uni-th">标题</uni-th>
						<uni-th align="center" class="uni-th">点击数</uni-th>
						<uni-th align="center" class="uni-th">点赞数</uni-th>
						<uni-th align="center" class="uni-th">时间</uni-th>
					</uni-tr>
					<uni-tr v-for="(o, i) in list" :key="i">
						<uni-td class="image" align="center">
							<image style="width:4rem;height: 4rem;" :src="$fullImgUrl(o[vm.img])" mode="scaleToFill">
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
			<!-- /表格 -->

			<!-- 列表 -->
			<view class="article_list_block row" v-show="!is_opened">
				<view class="col-12 col-sm-6" v-for="(o, i) in list" :key="i">
					<navigator class="item_article"
						:url="'/pages/article/details?' + vm.article_id + '=' + o[vm.article_id]">
						<image class="image" :style="{width:img_width,height:img_width}" :src="$fullImgUrl(o[vm.img])"
							mode="scaleToFill">
						</image>
						<view class="right_block">
							<view class="top_info">
								{{ o[vm.title] }}
							</view>
							<view class="mid_info">{{ $toTime(o[vm.create_time],"yyyy-MM-dd hh:mm:ss") }}</view>
							<view class="bottom_info">
								<text class="praise">{{ o[vm.praise_len] }}点赞</text>
								<text class="see">
									{{ o[vm.hits] }}点击
								</text>
							</view>
						</view>
					</navigator>
				</view>
			</view>
			<!-- /列表 -->
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
						article_id: "article_id",
						title: "title",
						description: "description",
						title: "title",
						create_time: "create_time",
						content: "content",
						praise_len: "praise_len",
						hits: "hits"
					}
				}
			},
			img_width: {
				type: String,
				default: "7rem"
			}
		},
		data() {
			return {
				is_opened: false,
				title: '切换成表格'
			}
		},
		methods: {
			error(o) {
				console.log(123, this.src);
			},
			show_table() {
				this.is_opened = !this.is_opened
				if (this.is_opened === true) {
					this.title = '切换成列表'
				} else {
					this.title = '切换成表格'
				}
			}
		}
	}
</script>

<style scoped>
	.list_article {
		margin-bottom: 1rem;
	}

	/* 表格 */
	.list_article .list_article_table {
		width: 100%;
	}
	
	.list_article .list_article_table .btn_change_table {
		margin-left: auto;
		font-weight: bold;
		padding: 0.5rem 0;
		width: 100px;
		text-align: center;
		font-size: 0.875rem;
		border: 1px solid #CCCCCC;
		border-radius: 1rem;
		margin-bottom: 0.5rem;
	}

	.list_article .list_article_table .uni-th {
		font-weight: 600;
	}
	.list_article .list_article_table .article_table_block .uni-table-td {
		padding: 8px;
	}

	.list_article .list_article_table .article_table_block .image {
		width: 10%;
	}

	.list_article .list_article_table .article_table_block .image>image {
		border-radius: 0.5rem;
	}

	.list_article .list_article_table .article_table_block .title {
		overflow: hidden;
		width: 30%;
		font-size: 0.5rem;
	}

	.list_article .list_article_table .article_table_block .hits {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_article .list_article_table .article_table_block .praise {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_article .list_article_table .article_table_block .create_time {
		width: 26%;
		font-size: 0.5rem;
	}

	/* *****表格 */

	/* 列表 */
	.list_article .article_list_block {
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;
		margin-left: -1rem;
		margin-right: -1rem;
	}

	.list_article .item_article {
		padding: 0.5rem 1rem;
		display: flex;
	}


	.list_article .item_article .right_block {
		flex: 1;
		margin-left: 1rem;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.list_article .image:hover {
		transform: rotateY(360deg);
		transition: all 0.5s ease-in-out;
	}

	.list_article .top_info {
		font-size: 1rem;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}


	.list_article .mid_info {
		font-size: 0.875rem;
		color: var(--color_grey)
	}

	.list_article .bottom_info {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		font-size: 0.875rem;
		color: var(--color_grey)
	}

	.list_article .see {
		margin-left: 1rem;
	}
</style>
