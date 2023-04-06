<template>
	<view class="list_registered_user" style="background-color: #fff;">
		<!-- 表格 -->
		<view class="list_registered_user_table">
			<view class="btn_change_table" @click="change_show()">
				{{ title }}
			</view>
			<view class="registered_user_table_block" v-show="is_opened">
				<uni-table stripe border emptyText="暂无更多数据">
					<uni-tr>
						<uni-th v-if="$check_index_field('get','user_name','/registered_user/list')" align="center">用户名</uni-th>
						<uni-th align="center">点击数</uni-th>
						<uni-th align="center">创建时间</uni-th>
						<uni-th align="center">操作</uni-th>
					</uni-tr>
					<uni-tr v-for="(o, i) in list" :key="i">
						<uni-td v-if="$check_index_field('get','user_name','/registered_user/list')" class="text" align="center">
							{{ o["user_name"] }}
						</uni-td>
						<uni-td align="center">{{ o["hits"] }}</uni-td>
						<uni-td align="center">{{ $toTime(o["create_time"],"yyyy-MM-dd hh:mm:ss") }}</uni-td>
						<uni-td align="center">
							<view @click="to_nav(o['registered_user_id'])" style="cursor: pointer;">查看详情</view>
						</uni-td>
					</uni-tr>
				</uni-table>
			</view>
		</view>
		<!-- /表格 -->

		<!-- 视图 -->
		<view class="registered_user_block box_wrap" v-show="!is_opened">
			<navigator class="item_registered_user box_style" v-for="(o, i) in list"  :key="i" :url="'/pages/registered_user/details?registered_user_id=' + o['registered_user_id']">
				<view class="view" v-if="0 && $check_index_field('get','user_name','/registered_user/list')">
					<view class="title" v-if="true">
						<span>用户名</span>
					</view>
					<view class="diy_field text" >
						<span>{{ o["user_name"] }}</span>
					</view>
				</view>
				<view class="bottom-view">
					<view class="hits-title">点击数<span>{{ o["hits"] }}</span></view>
				</view>
				<view class="view">
					<view class="create_time_block diy_field number">
						<span>{{ $toTime(o["create_time"],"yyyy-MM-dd hh:mm:ss") }}</span>
					</view>
				</view>
			</navigator>
		</view>
		<!-- /视图 -->
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
			}
		},
		data() {
			return {
				is_opened: false,
				title: '切换成表格',
			}
		},
		methods: {
			/**
			 *  跳转链接
			 *  @param {Object} id
			 */
			to_nav(id) {
				this.$nav('/pages/registered_user/details?registered_user_id=' + id)
			},

			/**
			 *  切换显示
			 */
			change_show() {
				this.is_opened = !this.is_opened;
				if (this.is_opened === true) {
					this.title = '切换成列表';
				}
				else{
					this.title = '切换成表格';
				}
			},
		},
		created() {
		}
	}
</script>

<style scoped>
	.list_registered_user {
		/* padding: 0 1rem; */
		margin-bottom: 1rem;
	}

	.list_registered_user .list_registered_user_table {
		width: 100%;
		padding: 5px 0;
	}

	.list_registered_user .list_registered_user_table .btn_change_table {
		margin-left: auto;
		font-weight: bold;
		padding: 0.5rem 0;
		width: 100px;
		text-align: center;
		font-size: 0.875rem;
		border: 1px solid #CCCCCC;
		border-radius: 1rem;
		margin-bottom: 0.25rem;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .uni-table-td{
		padding: 8px;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .image {
		width: 10%;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .text {
		overflow: hidden;
		width: 30%;
		font-size: 0.5rem;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .hits {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .praise {
		width: 12%;
		font-size: 0.5rem;
	}

	.list_registered_user .list_registered_user_table .registered_user_table_block .create_time {
		width: 26%;
		font-size: 0.5rem;
	}
	.list_registered_user .item_registered_user {
		display: flex;
		justify-content: space-between;
		align-items: stretch;
		padding: 0.75rem 1rem;

	}
	.list_registered_user .item_registered_user+.item_registered_user{
		border-top: 1px solid #dbdbdb;
	}
	.list_registered_user .item_registered_user .left>image {
		position: relative;
		top: 50%;
		transform: translate(0, -50%);
		border-radius: 0.5rem;
	}

	.list_registered_user .item_registered_user .right_block {
		width: calc(100% - 5rem);
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.list_registered_user .top {
		font-size: 0.9rem;
	}


	.list_registered_user .time {
		font-size: 0.6rem;
		color: var(--color_grey)
	}

	.list_registered_user .bottom {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		font-size: 0.5rem;
		color: var(--color_grey)
	}

	.list_registered_user .see {
		margin-left: 1rem;
	}
	.box_wrap{
		padding: 0.75rem;
	}
	.box_style{
		margin-bottom: 0.75rem;
		padding: 0.375rem;
		display: inline-block !important;
		border: 0.075rem solid #ccc;
		border-radius: 0.375rem;
		overflow: hidden;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.bottom-view,.create_time_block{
		font-size: 12px;
		color: #666666;
	}
	.bottom-view view{
		display: inline-block;
	}
	.bottom-view span{
		margin-left: 5px;
		margin-right: 10px;
	}
</style>
